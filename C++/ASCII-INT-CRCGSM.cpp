#include <iostream>
#include <vector>
#include <bitset>
#include <unistd.h>
#include "bitchain.hpp"
using namespace std;

int main (){
    string msg;
    cout << "Introduzca el mensaje: ";
    getline(cin,msg);
    string crc;
    cout << "Introduzca en binario el polinomio significativo del CRC: ";
    getline(cin,crc);
    bitChain a(msg);
    cout << msg <<" es igual a         : " << a.getChain() << endl;

    a.makeCRC(crc);

    cout<< msg <<" con CRC es igual a : " << a.getChain() << endl;
    sleep(2);
    cout << "Envidado mensaje de prueba" << endl;
    for (size_t i = 0; i < 5; i++)
    {
        cout << "Cargando : " << i*25 << "%" << endl;
        sleep(1);
    }
    if (a.checkCRC(crc))
    {
        cout << "Mensaje retribuido correctamente." << endl;
    }else{ cout << "Mensaje fallido" << endl; }
    
    
    return 0;
}