︠d50d0b95-0174-4d19-be01-c1eb693c0bd7︠
#El juego del nim
def game_repr(heap_sizes):
    return '\n'.join('%d:'%i+'*'*n for i,n in enumerate(heap_sizes))
def bitlist2number(bitlist):
    return int('0'+''.join([str(bit) for bit in reversed(bitlist)]),2)
def move_nim(heap_sizes):
    '''Given a nim game, returns the next move (heap and amount)
    '''
    all_digits=[n.bits() for n in heap_sizes]
    N=max(len(l) for l in all_digits)
    digi=[0]*N
    for l in all_digits:
        for i in range(len(l)):
            digi[i]+=l[i]
    digi2=[digi[i]%2 for i in range(len(digi))]
    if max(digi2)==0:raise Exception("I cannot win!")
    maxInd=max(i for i in range(N) if digi2[i])
    
    heap=min(i for i in range(len(heap_sizes)) if len(all_digits[i])>maxInd and all_digits[i][maxInd]>0)
    localbits=heap_sizes[heap].bits()[0:maxInd]
    globalbits=digi2[0:maxInd]
    correction=bitlist2number( [b2 if b2 and not b1 else 0 for b1,b2 in zip(localbits,globalbits)] ) - bitlist2number( [b2 if b2 and b1 else 0 for b1,b2 in zip(localbits,globalbits)] )
    amount=2^maxInd -correction
    return (heap,amount)

nim=[1,3,5,6]
@interact
def _(heap=selector(range(len(nim)), buttons=True),
      amount=selector(range(max(nim)+1), buttons=True),
      auto_update=False):
    global nim
    if max(nim)==0:
        print 'You have lost'
        return
    else:
        print 'Try to take the last item'
    if heap>=0 and 0<amount<=nim[heap]:
        print 'Previous situation:'
        print game_repr(nim)
        
        nim[heap]-=amount
        print 'Your move:'
        print game_repr(nim)
        if max(nim)==0:
            print 'You win'
            return
        
        print 'My move:'
        try:
            myheap,myamount=move_nim(nim)
        except:
            #cannot win, choose arbitrarily
            myheap=min(heap_number for heap_number, heap_size in enumerate(nim) if heap_size>0)
            myamount=1
        nim[myheap]-=myamount
        print game_repr(nim)
        if max(nim)==0:
            print 'I win'
        else:
            print 'Please move again'
    else:
        print 'Choose a heap and the amount to substract from that heap'
        print game_repr(nim)
︡e8f9f6d5-a5b3-4a3f-a7bb-f87db6cd5705︡{"interact":{"style":"None","flicker":false,"layout":[[["heap",12,null]],[["amount",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"322cae66-9f3a-4d12-88c5-4b998414e6ae","controls":[{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["0","1","2","3"],"label":"heap","nrows":null,"width":null,"var":"heap"},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["0","1","2","3","4","5","6"],"label":"amount","nrows":null,"width":null,"var":"amount"},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠534566af-aa05-42b7-bca1-7e15cfde66f5︠
︡e86b9491-d5cb-482c-8cd5-e085bb0711a8︡
︠c2243781-fefc-453e-9f43-bbaa27d3d47b︠









