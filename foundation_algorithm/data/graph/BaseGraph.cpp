#include "BaseGraph.hpp"

const int BaseGraph::StackSize = 1000;
BaseGraph::BaseGraph() {
    this->m_nStacks = new int[BaseGraph::StackSize];
}

BaseGraph::~BaseGraph() {
}

void BaseGraph::Push(int nElement) {
    this->m_nTop++;
    this->m_nStacks[this->m_nTop] = nElement;
}

int BaseGraph::Pop() {
    if (this->m_nTop == -1) {
        return -1;
    }
    int nData = this->m_nStacks[this->m_nTop];
    this->m_nTop--;
    return nData;
}

int BaseGraph::Peek() {
    if (this->m_nTop == -1) {
        return -1;
    }
    int nData = this->m_nStacks[this->m_nTop];
    return nData;
}

bool BaseGraph::IsEmpty() {
    return this->m_nTop <= -1;
}

void BaseGraph::Search() {
    return;
}

void BaseGraph::Write() {
    return;
}

void BaseGraph::Clear() {
    return;
}
