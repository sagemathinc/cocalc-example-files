︠5d1bc51f-82ed-4788-be30-397d0f758787︠
queens=[]
opciones=['Clean board', 'Add queen', 'Remove queen' ]

@interact
def _(queen=input_box(default=(0,0)), opcion=selector(opciones, buttons=True), auto_update=False ):
    global queens
    if opcion=='Clean board':
        queens=[]
    elif opcion=='Add queen':
        if queen not in queens:
            queens.append(queen)
    else:
        if queen in queens:
            queens.remove(queen)
        
    board=matrix(ZZ,8,8)
    for x in range(8):
        for y in range(8):
            board[x,y]=(x+y)%2*7
    for x,y in queens:
        for i in range(8):
            if i!=y:  board[x,i]=1+(x+i)%2*5
            if i!=x:  board[i,y]=1+(i+y)%2*5
        for i in range(-min(x,y),min(8-x,8-y)):
            if i!=0: board[x+i,y+i]=1+(x+y)%2*5
        for i in range(max(-x,y-7),min(8-x,y+1)):
            if i!=0: board[x+i,y-i]=1+(x+y)%2*5
    for x,y in queens:
        if ( board[x,y]==1 or board[x,y]==6 ):
            print 'Queen at (%d,%d) is threatened by another queen'%(x,y)
            board[x,y]=4  
        else:
            board[x,y]=3
    show(matrix_plot(board, cmap='Oranges' ))
︡cdc166ff-8611-454d-9b6f-a0f79c5ff056︡{"interact":{"style":"None","flicker":false,"layout":[[["queen",12,null]],[["opcion",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"7fb23ed2-fc3d-4bf1-b110-40385cf550ba","controls":[{"control_type":"input-box","default":"(0, 0)","label":"queen","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"queen","type":null},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Clean board","Add queen","Remove queen"],"label":"opcion","nrows":null,"width":null,"var":"opcion"},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠e991d67c-7304-4e17-85ad-10a9ec1981ae︠









