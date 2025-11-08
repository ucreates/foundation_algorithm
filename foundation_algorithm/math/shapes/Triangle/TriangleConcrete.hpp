#ifndef TriangleConcrete_hpp
#define TriangleConcrete_hpp
class TriangleConcrete {
private:
    int m_nBottom;
    int m_nHeight;

public:
    TriangleConcrete();
    TriangleConcrete(int nBottom, int nHeight);
    ~TriangleConcrete();
    int CalcArea();
};
#endif /* TriangleConcrete_hpp */
