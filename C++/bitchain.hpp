#pragma once
#include <iostream>
#include <vector>
#include <bitset>

using namespace std;

class bitChain
{
private:

    string chain;
    int size;

    //Non-accesible functions
    void crop0s();
    void crop0s(string &_chain, int size);
    void divXOR(string &bin,string div);
    string binXOR(string bin,string div);
public:
    //Constructors & Destructors
    bitChain(){ this->chain = ""; }
    bitChain(string ascii);
    bitChain(int translate);
    ~bitChain(){ };
    
    //Getters & Setters
    void setChain(string nchain);
    string getChain(){ return this->chain; }

    //Functions
    string makeParity(string toDo);
    bool checkCRC(string pol); //Returns true if mod between pol == 0 else false
    void makeCRC(string pol); //Recursive XOR function between pol till get redundancy bits (mod)

    //Operators
    friend bool operator ==(bitChain a1, bitChain a2)
    {   a1.crop0s(); a2.crop0s();
        return a1.chain == a2.chain;   }
};