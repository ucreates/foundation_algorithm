#ifndef ConvexLens_hpp
#define ConvexLens_hpp
class ConvexLens {
public:
    ConvexLens();
    ~ConvexLens();
    int CalcFocalDistance(int distanceFromObject, int distanceFromScreen);
};
#endif /* ConvexLens_hpp */
