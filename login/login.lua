local porta = "esquerda" -- Cima, Baixo, esquerda, direita, frente, tras

function orientacao(n)
local orientacoes =
{
   ['esquerda']= 'left',
  ['direita']= 'right',
  ['cima'] = 'top',
  ['baixo'] = 'back',
  ['frente'] = 'front',
  ['tras'] = 'tras',
}
return orientacoes[n]
end

function campo(correto,nome)
  print("Digite "..nome)
  local digitado = read()
  if(digitado==correto) then
    return 1
  end
  return 0
end

function valida(campos)
    local i
    for i=0, #campos do
      if not(campos[i]==1) then
        return 0
      end
    end
    return 1
end

local vetor_campos = {}
local login = campo("admin","login") -- CAMPO CORRETO, NOME DO CAMPO
local senha = campo("pass", "senha") -- Você pode criar multiplos campos de autenticação
vetor_campos[0]=login
vetor_campos[1]= senha


if not (valida(vetor_campos)==1) then
  print("Algum valor digitado e invalido")
  os.sleep(3)
  os.reboot()
end

print("Validado com sucesso")
redstone.setOutput(orientacao(porta), true)
os.sleep(3)
redstone.setOutput(orientacao(porta), false)
os.reboot()
