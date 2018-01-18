Toddler's Bottle unlink
-------------

```
void unlink(OBJ* P){
	OBJ* BK;
	OBJ* FD;
	BK=P->bk;
	FD=P->fd;
	FD->bk=BK;
	BK->fd=FD;
}
```

heap overflow를 통해서 B의 FD, BK를 변경할 수 있고, 마지막 두 줄로 인하여 원하는 주소에 원하는 값을 4 bytes 작성할 수 있다.

```
0x080485ff <+208>:	mov    -0x4(%ebp),%ecx
0x08048602 <+211>:	leave  
0x08048603 <+212>:	lea    -0x4(%ecx),%esp
0x08048606 <+215>:	ret
```

해당 어셈 부분을 간추리면 아래와 같이 된다.

```
ecx = ebp - 4
esp = ecx - 4
ret
```

그래서 ebp - 4 를 덮으면 esp까지 흘러들어가 최종적으로 실행될 것이라 생각했다.

```
Payload = shell address (4 bytes) + dummy (12 bytes) + [FD] heap address + 0xc (4 bytes) + [BK] stack address + 0x10
```
FD인 heap address + 0xc인 이유는 ecx에 담겨진 값이 - 4 가 되며, 그로 인해 FD - 4 를 참조하게 된다.
그렇기에 shell 주소를 가지고 있는 주소는 heap으로부터 + 0x8 이니, + 0x4를 더하여 ecx - 4 를 커버해준다.
최종적으로 esp에는 heap address + 0x8이 들어가게 된다.

BK의 stack address + 0x10인 이유는 최초 ebp의 값이 문제에서 주어지는 스택 주소 + 0x14이다.
하지만, ebp - 4 값을 ecx에 덮어야하기에 stack address + 0x14 -0x4 = stack address + 0x10 이 되었다.
