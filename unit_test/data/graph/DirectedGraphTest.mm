#include "DirectedGraph.hpp"
#import <XCTest/XCTest.h>
@interface DirectedGraphTest : XCTestCase

@end

@implementation DirectedGraphTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testGraphProcess {
    DirectedGraph *pDirectedGraph = new DirectedGraph();
    pDirectedGraph->AddVertex("A");
    pDirectedGraph->AddVertex("B");
    pDirectedGraph->AddVertex("C");
    pDirectedGraph->AddVertex("D");
    pDirectedGraph->AddVertex("E");
    pDirectedGraph->AddEdge(0, 1);
    pDirectedGraph->AddEdge(0, 2);
    pDirectedGraph->AddEdge(0, 3);
    pDirectedGraph->AddEdge(1, 2);
    pDirectedGraph->AddEdge(1, 3);
    pDirectedGraph->AddEdge(2, 3);
    pDirectedGraph->AddEdge(3, 4);
    pDirectedGraph->Write();
    pDirectedGraph->Search();
}

@end
