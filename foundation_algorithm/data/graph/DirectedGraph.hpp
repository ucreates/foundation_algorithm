#ifndef DirectedGraph_hpp
#define DirectedGraph_hpp
#include "BaseGraph.hpp"
#include "Vertex.hpp"
class DirectedGraph : public BaseGraph {
private:
    int m_nSize;
    Vertex **m_pVertexTable;
    int **m_nAdjancencyMatrix;

public:
    static const int MaxVertexSize;
    DirectedGraph();
    ~DirectedGraph();
    void AddVertex(const char *pchData);
    void AddEdge(int nFrom, int nTo);
    void Search() override;
    void Write() override;
    void Clear() override;
    int FindNotVisitedVertex(int nRow);
};
#endif /* DirectedGraph_hpp */
