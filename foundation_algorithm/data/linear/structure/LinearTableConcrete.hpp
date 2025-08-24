#ifndef LinearTableConcrete_hpp
#define LinearTableConcrete_hpp
class LinearTableConcrete {
private:
    int *m_nTable;
    int m_nTableSize;

public:
    LinearTableConcrete();
    LinearTableConcrete(int size);
    ~LinearTableConcrete();
    void Append(int value);
    void Insert(int index, int value);
    void Remove(int index);
    int Get(int index);
    int GetCount();
    int GetFirst();
    int GetLast();
};
#endif /* Liner_hpp */
