// Copyright (c) 2010 Gregoire Lejeune <gregoire.lejeune@free.fr>
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
//
// Usage :
//   gvpr -f dot2ruby.g [-a <output type>] <dot script>

BEGIN {
  int g_strict; int g_direct;
  graph_t cluster;
  node_t cnode;
  edge_t cedge;
  string attr; string attrv;
  graph_t subgraph; graph_t pgraph;
  graph_t ofgraph;

  string xOut;
  if( ARGC == 0 ) {
    xOut = "_";
  } else {
    xOut = tolower(ARGV[0]);
  }
  
  printf( "# This code was generated by dot2ruby.g\n\n" );

  string rubyfy( string s ) {
    string out;
    out = tolower( s );
    out = gsub( out, "[!a-zA-Z0-9_]", "_" );
    return( out );
  }

  string stringify( string s ) {
    string sout;
    sout = gsub(s, "\"", "\\\"");
    sout = gsub(sout, "@", "\\@");
    sout = gsub(sout, "$", "\\$");
    return( sout );
  }
}

BEG_G {
  printf( "require 'rubygems'\nrequire 'graphviz'\n");
  // Directed 
  g_direct = isDirect($);
  if( g_direct == 0 ) {
    printf( "graph_%s = GraphViz.graph( \"%s\"", rubyfy($.name), stringify($.name) );
  } else {
    printf( "graph_%s = GraphViz.digraph( \"%s\"", rubyfy($.name), stringify($.name) );
  }
  // Strict
  g_strict = isStrict($);
  if( g_strict != 0 ) {
    printf( ", :strict => true" );
  }
  printf( " ) { |graph_%s|\n", rubyfy($.name) );
  
  // Attributs of G
  attr = fstAttr($, "G");
  while( attr != "" ) {
    attrv = aget( $, attr );
    if( attrv != "" ) {
      printf( "  graph_%s[:%s] = '%s'\n", rubyfy($.name), attr, attrv );
    }
    attr = nxtAttr( $, "G", attr );
  }
  
  // Subgraph
  subgraph = fstsubg( $ );
  while( subgraph != NULL ) {
    pgraph = subgraph.parent;
    printf ( "  graph_%s = graph_%s.add_graph( \"%s\" )\n", rubyfy(subgraph.name), rubyfy(pgraph.name), rubyfy(subgraph.name) );
    
    // ATTRS
    attr = fstAttr(subgraph, "G");
    while( attr != "" ) {
      attrv = aget( subgraph, attr );
      if( attrv != "" ) {
        printf( "  graph_%s[:%s] = '%s'\n", rubyfy(subgraph.name), attr, attrv );
      }
      attr = nxtAttr( subgraph, "G", attr );
    }
    
    subgraph = nxtsubg( subgraph );
  }
}

N {
  pgraph = $.root;
  ofgraph = pgraph;

  subgraph = fstsubg( pgraph );
  while( subgraph != NULL ) {
    if( isSubnode( subgraph, $ ) != 0 ) {
      ofgraph = subgraph;
    }
    subgraph = nxtsubg( subgraph );
  }
  
  printf( "  node_%s = graph_%s.add_nodes( \"%s\"", rubyfy($.name), rubyfy(ofgraph.name), stringify($.name) );

  // Attributs of N
  attr = fstAttr($G, "N");
  while( attr != "" ) {
    attrv = aget( $, attr );
    if( attrv != "" ) {
      printf( ", :%s => '%s'", attr, gsub( attrv, "'", "\\'" ) );
    } else {
      printf( ", :%s => ''", attr );
    }
    attr = nxtAttr( $G, "N", attr );
  }
  
  printf( " )\n");
}

E {
  pgraph = $.root;
  ofgraph = pgraph;

  subgraph = fstsubg( pgraph );
  while( subgraph != NULL ) {
    if( isSubedge( subgraph, $ ) != 0 ) {
      ofgraph = subgraph;
    }
    subgraph = nxtsubg( subgraph );
  }

  printf( "  graph_%s.add_edges( \"%s\", \"%s\"", rubyfy(ofgraph.name), stringify($.tail.name), stringify($.head.name) );
  
  // Attributs of E
  attr = fstAttr($G, "E");
  while( attr != "" ) {
    attrv = aget( $, attr );
    if( attrv != "" ) {
      printf( ", :%s => '%s'", attr, gsub( attrv, "'", "\\'" ) );
    } else {
      printf( ", :%s => ''", attr );
    }
    attr = nxtAttr( $G, "E", attr );
  }
  
  printf( " )\n" );
}

END_G {
  printf( "}\n" );
  if( xOut != "_" ) {
    if( xOut == "-" ) {
      printf( "@_graph_eval = graph_%s\n", rubyfy($.name) );
    } else {
      printf( "graph_%s.output( :%s => \"%s.%s\" )\n", rubyfy($.name), xOut, gsub($F, ".*/", ""), xOut );
    }
  }
}
