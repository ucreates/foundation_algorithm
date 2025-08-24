#ifndef LinearTableTemplate_hpp
#define LinearTableTemplate_hpp
template <class T> class LinearTableTemplate {
private:
    T *m_tTable;
    int m_nTableSize;

public:
    LinearTableTemplate();
    LinearTableTemplate(int size);
    ~LinearTableTemplate();
    void Append(T value);
    void Insert(int index, T value);
    void Remove(int index);
    T Get(int index);
    int GetCount();
    T GetFirst();
    T GetLast();
};
#endif /* LinearTableTemplate_hpp */
