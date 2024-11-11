#include <iostream>
using namespace std;
void initialize(char arr[], int  x) {
    int i = 0;
    for (i = 0; i < x; i++) {
        arr[i] = ' ';
    }
}
void print(char arr[], int x, int y){
    int i = 0;
    if (y == x - y - 1) {
        cout << "     Dynamic     ";
    }
    else {
        cout << "                 ";
    }
    for (i = 0; i < x; i++) {
        cout << arr[i] ;
    }
    cout << endl;
}
int main() {
    int input = 0;
    cout<<"input a odd number"<<endl;
    cin>>input;
    char arr[input];
    initialize(arr, input);
    int i = 0;
    for(i = 0; i < input; i++) {
        arr[i] = '*';
        arr[input - 1 - i] = '*';
        print(arr, input, i);
        initialize(arr, input);
    }
    return 0;
}
