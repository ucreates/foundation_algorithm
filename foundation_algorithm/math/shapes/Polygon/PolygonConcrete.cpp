#include "PolygonConcrete.hpp"

PolygonConcrete::PolygonConcrete() {
}
PolygonConcrete::PolygonConcrete(unsigned int nPolygonCount) {
    this->m_nPolygonCount = nPolygonCount;
}
PolygonConcrete::~PolygonConcrete() {
}
unsigned int PolygonConcrete::SumOfInteriorAngles() {
    if (2 > this->m_nPolygonCount) {
        return 0;
    }
    return 180 * (this->m_nPolygonCount - 2);
}
