#ifndef Triangle_hpp
#define Triangle_hpp
template <class T> class TriangleTemplate {
private:
    T m_tBottom;
    T m_tHeight;

public:
    TriangleTemplate();
    TriangleTemplate(T tBottom, T tHeight);
    ~TriangleTemplate();
    T CalcArea();
};
#endif /* Triangle_hpp */
