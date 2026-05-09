#include "AtkinSieve.hpp"
#include <stdio.h>

std::vector<unsigned long long> AtkinSieve::Sieve(unsigned long long llValue) {
    std::vector<bool> vecFlag(llValue + 1ULL, false);
    std::vector<unsigned long long> vecResult;
    if (llValue < 2) {
        return vecResult;
    }
    // 4つの条件から素数候補のフラグを立てる
    for (unsigned long long x = 1ULL; x * x <= llValue; x++) {
        for (unsigned long long y = 1ULL; y * y <= llValue; y++) {
            // 条件1:4x2 + y2 = n
            unsigned long long llCond = (4ULL * x * x) + (y * y);
            if (llCond < llValue && (llCond % 12 == 1 || llCond % 12 == 5)) {
                vecFlag[llCond] = !vecFlag[llCond];
            }
            // 条件2:3x2 + y2 = n
            llCond = (3ULL * x * x) + (y * y);
            if (llCond < llValue && llCond % 12 == 7) {
                vecFlag[llCond] = !vecFlag[llCond];
            }
            // 条件3:3x2 - y2 = n
            llCond = (3ULL * x * x) - (y * y);
            if (x > y && llCond < llValue && llCond % 12 == 11) {
                vecFlag[llCond] = !vecFlag[llCond];
            }
            // 条件4:コード書かない
        }
    }
    // 4つの条件から洗い出した素数候補の平方根に対してフラグを立てる
    for (unsigned long long i = 5ULL; i * i <= llValue; i++) {
        if (vecFlag[i]) {
            unsigned long long llCnt = i * i;
            for (unsigned long long j = llCnt; j <= llValue; j += llCnt) {
                vecFlag[j] = false;
            }
        }
    }
    // 2と3は定数で追加
    vecResult.push_back(2);
    vecResult.push_back(3);
    // 5以降はフラグが立ってる場合ならば素数判定
    for (unsigned long long i = 5ULL; i <= llValue; i++) {
        if (vecFlag[i]) {
            vecResult.push_back(i);
        }
    }
    return vecResult;
}
