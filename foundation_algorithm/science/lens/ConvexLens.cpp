#include "ConvexLens.hpp"
ConvexLens::ConvexLens() {
}

ConvexLens::~ConvexLens() {
}

int ConvexLens::CalcFocalDistance(int distanceFromObject, int distanceFromScreen) {
    return (distanceFromObject * distanceFromScreen) / (distanceFromObject + distanceFromScreen);
}
