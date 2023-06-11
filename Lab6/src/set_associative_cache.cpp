#include "set_associative_cache.h"
#include "string"
#include <math.h>
#include <queue>
#include <vector>
#include <iostream>
using namespace std;

float set_associative(string filename, int way, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;
	int miss_num=0;
    /*write your code HERE*/
    FILE *fptr = fopen(filename.c_str(), "r");
    int Set_num = cache_size / block_size / way, bit = log2(Set_num);
    int offset_bit = log2(block_size);
    unsigned int in;
    vector<queue<int>> cache(Set_num + 1, queue<int>());
    while (fscanf(fptr, "%x", &in) != EOF) {
    	unsigned int index = (in << (32 - bit - offset_bit)) >> (32 - bit);
    	unsigned int tag = in >> (bit + offset_bit);
    	queue<int> tmp1 = cache[index], tmp2;
    	bool find = 0;
        while (!tmp1.empty()) {
            if (tmp1.front() == tag)
                find = 1;
            else
                tmp2.push(tmp1.front());
            tmp1.pop();
        }
        if (find) {
        	tmp2.push(tag);
            cache[index] = tmp2;
            hit_num++;
        } 
		else {
            if (cache[index].size() < way) {
                cache[index].push(tag);
            } 
			else {
                cache[index].pop();
                cache[index].push(tag);
            }
            miss_num++;
        }
	}
    fclose(fptr);
    total_num=hit_num+miss_num;
    return (float)hit_num/total_num;
}
