#ifndef Macro_h
#define Macro_h
#ifndef SAFE_DELETE
#define SAFE_DELETE(p)   \
    {                    \
        if (p != NULL) { \
            delete (p);  \
            (p) = NULL;  \
        }                \
    }
#endif

#ifndef SAFE_DELETE_ARRAY
#define SAFE_DELETE_ARRAY(p) \
    {                        \
        if (p != NULL) {     \
            delete[] (p);    \
            (p) = NULL;      \
        }                    \
    }
#endif
#endif /* Macro_h */
