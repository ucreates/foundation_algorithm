#ifndef PolygonConcrete_hpp
#define PolygonConcrete_hpp
class PolygonConcrete {
private:
    unsigned int m_nPolygonCount;

public:
    PolygonConcrete();
    PolygonConcrete(unsigned int nPolygonCount);
    ~PolygonConcrete();
    unsigned int SumOfInteriorAngles();
};
#endif /* PolygonConcrete_hpp */
