#include <iostream>
#include <fstream>

using namespace std;

// *******************************************************************************
class Encryption {
private:
    int key;
    void encrypt();
    void decrypt();
    string theFile;
    string theEncryptedFile;
public:
    void startMeUp();
};

void Encryption::startMeUp()
{
    int X;
    cout << "Type a number:\n";
    cout << "  1) Encrypt a file.\n";
    cout << "  2) Decrypt a file.\n";
    cout << "  0) Quit.\n";
    cin >> X;

    if (X == 1) encrypt();
    if (X == 2) decrypt();
    if (X == 0) return;
}

// -------------------------------------------------------------------------------
void Encryption::decrypt()
{
    cout << "**********************************************************************\n";

    cout << "File to be decrypted: ";
    cin >> theFile;

    cout << "Enter the key: ";
    cin >> key;

    fstream a_file;
    a_file.open(theFile, ios::in);
    if (!a_file) {
        cout << "File not found!\n";
        return;
    }

    char ch;
    int aNum = key % 26;   // 0 to 25 limit
    while (1) {
        a_file >> ch;
        if (a_file.eof())
            break;
        ch = ch - aNum;
        cout << ch;
    }
}

// -------------------------------------------------------------------------------
void Encryption::encrypt()
{
    cout << "**********************************************************************\n";

    cout << "File to be encrypted: ";
    cin >> theFile;

    fstream a_file;
    a_file.open(theFile, ios::in);
    if (!a_file) {
        cout << "File not found!\n";
        return;
    }

    cout << "Name of the encrypted file: ";
    cin >> theEncryptedFile;
    fstream b_file;
    b_file.open(theEncryptedFile, ios::out);

    cout << "Enter a key: ";
    cin >> key;

    char ch;
    int aNum = key % 26;   // 0 to 25 limit
    while (1) {
        a_file >> ch;
        if (a_file.eof())
            break;
        if ((ch >= ' ') & (ch <= '~'))
        {
            ch = ch + aNum;
            cout << ch;
            b_file << ch;
        } else {
            cout << ch;
            b_file << ch;
        }
    }

    b_file.close();
    a_file.close();
}

// *******************************************************************************
int main ( int argc, char **argv )
{
    Encryption E;
    E.startMeUp();

    return 0;
}
