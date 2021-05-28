
#include "insertion_sort.h"

void insertion_sort(data_inp A[])
{
    for (int i = 1; i < N; i++)
    {
        int key = A[i];
        int j = i - 1;
        while ( j >= 0 && A[j] > key )
        {
            A[j + 1] = A[j];
            j = j - 1;
        }
        A[j + 1] = key; 
    }
}