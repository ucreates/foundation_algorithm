#ifndef Spring_hpp
#define Spring_hpp
class Spring {
public:
    Spring();
    ~Spring();
    float CalcPower(float fWeight, float fSpringExtension);
    float CalcSpringExtension(float fWeight, float fN);
};
#endif /* Spring_hpp */
