#include "direct_mapped_cache.h"
#include "string"
#include <math.h>
#include <iostream>
#include <vector>

using namespace std;

float direct_mapped(std::string filename, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;
    int miss_num=0;
    /*write your code HERE*/
  	FILE *fptr = fopen(filename.c_str(), "r");
  	int block_num = cache_size / block_size, bit = log2(block_num);
  	int offset_bit = log2(block_size);
  	unsigned int in;
  	vector<pair<unsigned int, unsigned int>> cache(block_num + 1, {0, 0});
  	while (fscanf(fptr, "%x", &in) != EOF) {
  		unsigned int index = (in << (32 - bit - offset_bit)) >> (32 - bit);
  		unsigned int tag = in >> (bit + offset_bit);
  		if (cache[index].first == 0) {
                    cache[index] = {1, tag};
                    miss_num++;
        }
        else {
            if (cache[index].second != tag) {
                cache[index] = {1, tag};
                miss_num++;
                } 
			else
                hit_num++;
        }
	}
	total_num=hit_num+miss_num;
  	fclose(fptr);
    return (float)hit_num/total_num;
}
