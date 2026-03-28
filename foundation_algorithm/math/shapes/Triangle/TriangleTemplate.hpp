#ifndef Triangle_hpp
#define Triangle_hpp
template <class T> class TriangleTemplate {
private:
    T m_tBottom;
    T m_tHeight;
    T *m_tEdges;

public:
    TriangleTemplate();
    TriangleTemplate(T tBottom, T tHeight);
    TriangleTemplate(T *tEdges);
    ~TriangleTemplate();
    T CalcArea();
    T *CalcScale(T tScale, bool bMultipliedOrdivided);
};
#endif /* Triangle_hpp */
