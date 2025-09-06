#ifndef LinearTableConcrete_hpp
#define LinearTableConcrete_hpp
class LinearTableConcrete {
private:
    int *m_nTable;
    int m_nTableSize;

public:
    LinearTableConcrete();
    LinearTableConcrete(int nSize);
    ~LinearTableConcrete();
    void Append(int nValue);
    void Insert(int nIndex, int nValue);
    void Remove(int nIndex);
    int Get(int nIndex);
    int GetCount();
    int GetFirst();
    int GetLast();
};
#endif /* Liner_hpp */
