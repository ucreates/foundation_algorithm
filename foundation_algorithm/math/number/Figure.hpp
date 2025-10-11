#ifndef Figure_hpp
#define Figure_hpp
template <class T> class Figure {
public:
    Figure();
    ~Figure();
    static int Count(T nNumber, int nCount = 1);
    static int GetFigure(T nNumber, int nFigure);
};
#endif /* Figure_hpp */
