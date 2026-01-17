#ifndef BaseGraph_hpp
#define BaseGraph_hpp
class BaseGraph {
private:
    int m_nTop;
    int *m_nStacks;

public:
    static const int StackSize;
    BaseGraph();
    ~BaseGraph();
    void Push(int nElement);
    int Pop();
    int Peek();
    bool IsEmpty();
    virtual void Search();
    virtual void Write();
    virtual void Clear();
};
#endif /* BaseGraph_hpp */
