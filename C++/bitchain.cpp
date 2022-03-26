#include <iostream>
#include <vector>
#include <bitset>
#include "bitchain.hpp"
using namespace std;

void bitChain::crop0s(){
    auto it = this->chain.begin();
    while(*it =='0' && it != this->chain.end()){
        it = chain.erase(it);
    }
}

void bitChain::crop0s(string &_chain,int size){
    auto it = _chain.begin();
    while(*it =='0' && it != _chain.end() && _chain.size()>size){
        it = _chain.erase(it);
    }
}

void bitChain::divXOR(string &bin,string div){
    if(bin.size() == div.size()-1) return;

    auto itd = div.begin();
    auto temp = bin.begin();

    while(itd != div.end()){
        if(*itd != *temp) *temp = '1';
        else *temp = '0';

        //stop recursive calls if we got to the end of the message.
        if(temp == bin.end()) return;
        itd++; temp++;
    }
    //0s from the redundancy bits must not be erased.
    crop0s(bin,div.size()-1);
    //Recursive call
    divXOR(bin,div);
}


string bitChain::binXOR(string bin,string div){
    for (int i = 0; i < div.size()-1; i++)
    { bin += '0'; }
    
    auto itd = div.begin();
    auto temp = bin.begin();

    //XOR member by member between "itd" and "temp" till itd == div.end()
    while(itd != div.end()){
        if(*itd != *temp) *temp = '1';
        else *temp = '0';

        //stop recursive calls if we got to the end of the message.
        if(temp == --bin.end()) return bin;
        itd++; temp++;
    }
    //0s from the redundancy bits must not be erased.
    crop0s(bin,div.size()-1);
    //Recursive call
    divXOR(bin,div);
    return bin;
}

bitChain::bitChain(string ascii)
{
    //ASCII is base 8 bits so translate to bit call must be 8
    for(auto i : ascii)
    { this->chain = chain + bitset<8>(i).to_string(); }
    this->size = chain.size();
    crop0s();
}

//este constructor no construye bien.
bitChain::bitChain(int translate)
{
    //int is 4 bytes long, 1 byte is 8 bits so 4*8 = 32
    this->chain = bitset<32>(translate).to_string();
    //now lets crop the 0s
    this->crop0s();
    cout << chain;
    this->size = chain.size();
}

void bitChain::setChain(string nchain){
    for(auto i : nchain)
    { this->chain = chain + std::bitset<8>(i).to_string();
      this->size = chain.size(); }
}

bool bitChain::checkCRC(string pol){
    string newstr = binXOR(chain,pol);
    crop0s(newstr,0);
    return newstr.empty();
}

void bitChain::makeCRC(string pol){
    string newstr = this->chain;
    newstr = binXOR(newstr,pol);
    
    chain += newstr;
}

string bitChain::makeParity(string toDO){
    string newParity;
    int lastparity;

    
    for(auto x : toDO){
        //Convert 
        int acum = 0;
        string add = bitset<7>(x).to_string();
        //crop0s(add,0);

        for(auto y : add){
            if(y == '1') acum++;
        }

        if(acum%2 == 0){ add+='1'; lastparity++; }
        else{ add+='0'; }
        int count = 0;
        for(auto x: add) if(x == '1') count++;
        cout << add << " bits : " << count << endl;
        newParity+=add;
    }
    if (lastparity%2 > 0)
        newParity+='1';
    else newParity+='0';
    
    return newParity;
}

