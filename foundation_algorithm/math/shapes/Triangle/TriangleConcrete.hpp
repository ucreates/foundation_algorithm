#ifndef TriangleConcrete_hpp
#define TriangleConcrete_hpp
class TriangleConcrete {
private:
    int m_nBottom;
    int m_nHeight;
    int *m_nEdges;

public:
    TriangleConcrete();
    TriangleConcrete(int nBottom, int nHeight);
    TriangleConcrete(int *nEdges);
    ~TriangleConcrete();
    int CalcArea();
    int *CalcScale(int nScale, bool bMultipliedOrdivided);
};
#endif /* TriangleConcrete_hpp */
