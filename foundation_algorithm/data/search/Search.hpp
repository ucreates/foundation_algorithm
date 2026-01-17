#ifndef Search_hpp
#define Search_hpp
class Search {
private:
    int *m_nTable;
    int m_nTableSize;

public:
    Search();
    Search(int nSize);
    ~Search();
    void Append(int nValue);
    int Liner(int nValue);
    int Binary(int nValue);
    int GetCount();
};
#endif /* Search_hpp */
