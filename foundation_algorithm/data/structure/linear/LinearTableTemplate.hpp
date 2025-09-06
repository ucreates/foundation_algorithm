#ifndef LinearTableTemplate_hpp
#define LinearTableTemplate_hpp
template <class T> class LinearTableTemplate {
private:
    T *m_tTable;
    int m_nTableSize;

public:
    LinearTableTemplate();
    LinearTableTemplate(int nSize);
    ~LinearTableTemplate();
    void Append(T tValue);
    void Insert(int nIndex, T tValue);
    void Remove(int nIndex);
    T Get(int nIndex);
    int GetCount();
    T GetFirst();
    T GetLast();
};
#endif /* LinearTableTemplate_hpp */
