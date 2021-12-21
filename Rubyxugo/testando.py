valor = int(raw_input('Quanto deseja retirar ? '))

//Notas disponiveis
notasD = [100, 50, 20, 10, 5]

//Notas usadas
notasU = [0, 0, 0, 0, 0]

i = int(0)

//Valor da soma
valorS = int(0)
while True:
    if(valorS + notasD[i] > valor):
        i += 1
    else:
        if(valor - (valorS + notasD[i]) != 1):
            valorS += notasD[i]
            if(valorS == valor):
                notasU[i] += 1
                break
            else:
                notasU[i] += 1
        else:
            i += 1
print 'Notas de 100 -> '+str(notasU[0])
print 'Notas de 50 -> '+str(notasU[1])
print 'Notas de 20 -> '+str(notasU[2])
print 'Notas de 10 -> '+str(notasU[3])
print 'Notas de 5 -> '+str(notasU[4])
print 'Notas de 2 -> '+str(notasU[5])