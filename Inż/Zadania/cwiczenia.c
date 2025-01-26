#include <stdio.h>

void g(int x) {
    if (x < 10) g(2 * x);
    printf("%d, ", x);
    if (x % 2 == 0) g(x + 1);
}

int main(void) {
    g(3);
    return 0;
}

A. 12, 6, 13, 3, 7, 15,
B. 12, 6, 13, 15, 3, 7,
C. 6, 12, 13, 15, 3, 7,
D. 6, 12, 3, 7, 13, 15,

no to mamy tak
pierwsze wywołanie
f(3)
    f(6)
        f(12)
        print 12
            f(13)
            print 13
            end
        end
    print  6
        f(7)
            f(14)
            print 14
                f(15)
                print 15
                end
            end
        print 7
        end
    end
print 3 
end
czyli mamy 12 13 6 14 15 7 3 
// -----------------------
void f(long *p1, long *p2, long x){
    while(p1!=p2){
        if( *p1<x)
            printf("%ld, ", *p1);
        ++p1;
    }
}
long a[15]={15, 3, 16, 1, 7, 40, 8, 2, 10, 3, 5, 61, 5, 11, 9};
f(a+2, a+10, 8);

to wywołujemy funkcje z 
    p1 jest na adresie a[2] = 16
    a p2 jest na adresie [10] = 5 

    while (adres a[2] != a[10])
    {
            // tutaj kolejne iteracje 
            1. p1 jest na 2 
            16 < 8 
                not print
            2. p1 jest na 3 = 1 
            print 1
            3. p1 jest na 4 = 7
            pritn 7
            4. p1= 5 = 40
            not print
            5. p1= 6 = 8
            not print
            6.p1 = 7 = 2
            print 2 
            7 p1= 8 = 10
            not print
            8. p1 = 9 =3
            print 3 
            9 pq = 10 nie wchodzimy 

    }
na koncu printujemy 1 7 2 3 czyli odpowiedz A 
#include <stdio.h>

void f(int *x, int *y) {
    *x += 5;
    *y = *x + *y;
}

int main() {
    int a = 3, b = 7;
    f(&a, &b);
    printf("%d %d\n", a, b);
    return 0;
}

no to tak mamy a = 3 i b =7
do funkcji przekazuejmy adresy tych zmiennych wiec będą onne modyfikowane
w funkcji 
wartosc wyłuskaną inkrementujemy o 5
a y robimy jako wartosc juz zinkrementowana + wartosc wyłuskaną z y 
czyli bedzie
3 +5 = 8
8 + 7 = 15 
czyli print to bedzie 8 i 15 