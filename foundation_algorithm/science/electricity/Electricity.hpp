#ifndef Electricity_hpp
#define Electricity_hpp
class Electricity {
public:
    Electricity();
    ~Electricity();
    int CalcVoltage(int nAmpere, int nResistance);
    int CalcAmpere(int nVoltage, int nResistance);
    int CalcJoule(int nElectricityPower, int nSecond);
};
#endif /* Electricity_hpp */
