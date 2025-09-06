#ifndef NumberTemplate_hpp
#define NumberTemplate_hpp
template <class T> class NumberTemplate {
public:
    NumberTemplate();
    ~NumberTemplate();
    int SizeOfNumber(T tValue1, T tValue2);
    T Plus(T tValue1, T tValue2);
    T Minus(T tValue1, T tValue2);
    T Multiplication(T tValue1, T tValue2);
    T Division(T tValue1, T tValue2);
};
#endif /* NumberTemplate_hpp */
