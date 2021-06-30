*** Settings ***
Documentation       Aqui estarão todos os exercicios do prime experts.
...                 Lembrando que é de suma importância termos a descrição de cada arquivo.

*** Variable ***
${NOME}     Patrícia

&{PESSOA}
...         nome=Patrícia
...         sobrenome=Miranda
...         idade=23
...         sexo=femininho
...         cpf=12345678901
...         carro=uno


@{FRUTAS}       abacaxi     laranja     morango     banana

***Test Cases***
Cenário: Imprimir todas as informações da PESSOA contidas no dicionário
    Log To Console          ${PESSOA.nome}
    Log To Console          ${PESSOA.sobrenome}
    Log To Console          ${PESSOA.idade}
    Log To Console          ${PESSOA.sexo}
    Log To Console          ${PESSOA.cpf}
    Log To Console          ${PESSOA.carro}

Cenário: Imprimir lista de FRUTAS
    Log To Console          ${FRUTAS[O]}
    Log To Console          ${FRUTAS[1]}
    Log To Console          ${FRUTAS[2]}
    Log To Console          ${FRUTAS[3]}
    Log To Console          ${FRUTAS[4]}

Cenário: Meu teste de Soma
    [Tags]      SOMA
    ${RESULTADO}            Somar dois números  658  845
    Log To Console          ${RESULTADO}

    ${RESULTADO_B}          Somar os números "1562" e "1895"
    Log To Console          ${RESULTADO_B}

Cenário: Criando meu e-mail
    [Tags]      EMAIL
    ${EMAIL_NOVO}           Criando e-mail  patricia  miranda  23
    Log To Console          ${EMAIL_NOVO}

Cenário: Utilizando o FOR na prática
    [Tags]      LUPING
    Contar de 0 a 9

    Percorrer itens de uma lista

Cenário: FOR exercicios
    [Tags]      Contar
    Contador de 0 a 10

Cenário: Paises
    [Tags]      PAIS
    Nomes de países

Cenário: Validando o IF
    [Tags]      TESTE_IF
    Else e IF com FOR  0  10

*** Keywords ***
Somar dois números
    [Arguments]         ${NUM_A}        ${NUM_B}
    ${SOMA}             Evaluate        ${NUM_A}+${NUM_B}
    [Return]            ${SOMA}

Somar os números "${NUM_A}" e "${NUM_B}"
    ${SOMA}             Evaluate        ${NUM_A}+${NUM_B}
    [Return]            ${SOMA}

Criando e-mail
    [Arguments]         ${NOME}         ${SOBRENOME}        ${IDADE}
    ${EMAIL}            Catenate        SEPARATOR=_         ${NOME}     ${SOBRENOME}        ${IDADE}@robot.com
    [Return]            ${EMAIL}

Contar de 0 a 9
    FOR     ${count}        IN RANGE    0   9
        Log To Console      ${count}
    END

Percorrer itens de uma lista
    FOR     ${fruta}        IN      ${FRUTAS}
        Log To Console      ${frutas}
    END

Contador de 0 a 10
    FOR     ${numero}      IN RANGE     0   10
        Log To Console      Estou no número ${numero}
    END

Nomes de países
    FOR     ${pais}         IN    Brasil  Argentina   Equador     Chile   Mexico
        Log To Console      ${pais}
    END 

Else e IF com FOR
    [Arguments]         ${NUM_A}        ${NUM_B}
    FOR         ${numero}       IN RANGE    ${NUM_A}        ${NUM_B}

        IF      '${numero}'=='5'
            Log To Console          Estou no numero: ${numero}
        ELSE IF     '${numero}'=='8'
            Log To Console          Estou no numero: ${numero}
        END
    END
    