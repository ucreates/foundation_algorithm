#ifndef Weight_hpp
#define Weight_hpp
class Weight {
public:
    Weight();
    ~Weight();
    float CalcOnEarth(float fQuality);
    float CalcOnMoon(float fQuality);
    float CalcByQualityAndGravity(float fQuality, float fGravity);
};
#endif /* Weight_hpp */
