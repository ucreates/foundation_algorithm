#ifndef Circle_hpp
#define Circle_hpp
class CircleConcrete {
private:
    unsigned int m_nDiameter;

public:
    CircleConcrete();
    CircleConcrete(unsigned int nDiameter);
    ~CircleConcrete();
    float CalcCircumference();
    float CalcArea();
    float CalcRadius();
};
#endif /* Circle_hpp */
