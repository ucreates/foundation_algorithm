#ifndef Quality_hpp
#define Quality_hpp
class Quality {
public:
    Quality();
    ~Quality();
    float CalcOnEarth(float fWeight);
    float CalcOnMoon(float fWeight);
    float CalcByWeightAndGravity(float fWeight, float fGravity);
};
#endif /* Quality_hpp */
