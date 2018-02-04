# Toddler's Bottle memcpy
---
선수 지식:
 - movntps


`
The memory operand must be aligned on a 16-byte (128-bit version), 32-byte (VEX.256 encoded version) or 64-byte (EVEX.512 encoded version) boundary otherwise a general-protection exception (#GP) will be generated.
`

해당 명령어는 피연산자 메모리 정렬이 16, 32, 64 Bytes가 되지 않으면 에러를 일으키는 어셈 명령어.

pwnable.kr 에서 소스를 제공하니 다음과 같이 주소를 찍어보면서 하는 것을 추천.
```
...
memcpy(cache1, cache2, 0x4000);		// to eliminate cache effect
t1 = rdtsc();
printf("src: %p, dest: %p\n", src, dest); // Added source code.
fast_memcpy(dest, src, size);		// block-to-block memcpy
t2 = rdtsc();
printf("ellapsed CPU cycles for fast_memcpy : %llu\n", t2-t1);
printf("\n");
...
```
