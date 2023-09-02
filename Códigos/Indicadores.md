# Indicadores Criados

## Indicadores criados:

1. Qual faculdade possui mais alunos matriculados
2. Quais cursos possuem pelo menos 4 alunos matriculados
3. Quais cursos não possuem nenhum aluno matriculado
4. Quanto cada aluno irá pagar até o final do curso (considerando que o valor se mantenha até o final do curso)

## Conceitos aplicados

* Recuperações simples com SELECT Statement;
* Filtros com WHERE Statement;
* Crie expressões para gerar atributos derivados;
* Defina ordenações dos dados com ORDER BY;
* Condições de filtros aos grupos – HAVING Statement;
* Crie junções entre tabelas para fornecer uma  perspectiva mais complexa dos dados;

## 1. Qual faculdade possui mais alunos matriculados

Para gerar este indicador, foi uma consulta juntando utilizando as tabelas Aluno e Faculdade

```
SELECT f.NomeFaculdade, COUNT(*) AS Qtd_Alunos_Matriculados  FROM Aluno AS a
INNER JOIN Faculdade as f 
ON f.IdFaculdade = a.IdFaculdade
GROUP BY a.IdFaculdade;
```
![AlunosPorFaculadde](https://github.com/augustohanashiro/MySql_Desafio_2/assets/49253803/70875275-5d53-4b9e-b7ca-a5d5bf84bc21)

## 2. Quais cursos possuem pelo menos 4 alunos matriculados

Para este indicador, foi feito uma consulta nas tabelas Aluno e Curso

```
SELECT c.NomeCurso, count(*) AS Qtd_Alunos_Matriculados  FROM Aluno AS a
   INNER JOIN Curso AS c 
   ON c.IdCurso = a.IdCurso
   GROUP BY a.IdCurso
   HAVING Qtd_Alunos_Matriculados >= 4;
```

![AlunosMateria](https://github.com/augustohanashiro/MySql_Desafio_2/assets/49253803/362ab029-148c-4c23-801e-98075b2fac1c)


## 3. Quais cursos não possuem nenhum aluno matriculado

Para este indicador, foi feito uma consulta nas tabelas Aluno e Curso novamente, podendo ser feito de duas maneiras
A primeira apenas com a cláusula where, e a segunda com um left join;

```
SELECT NomeCurso  FROM curso AS c 
WHERE c.idCurso NOT IN (SELECT idCurso FROM aluno);

--                         OU

SELECT NomeCurso  FROM curso AS c 
LEFT JOIN aluno a 
ON c.IdCurso = a.IdCurso
WHERE a.idaluno IS NULL;
```

![CursosSemAlunos](https://github.com/augustohanashiro/MySql_Desafio_2/assets/49253803/a34bf907-781e-4d07-84e7-80381a42367d)

## 4. Quanto cada aluno irá pagar até o final do curso (considerando que o valor se mantenha até o final do curso)

Para este indicador, foi feito uma consulta nas tabelas Aluno e Curso 


```
SELECT CONCAT(a.PrimeiroNome," ",a.Sobrenome) AS NomeCompleto, c.NomeCurso, c.DuracaoAnos*12 AS DuracaoMeses, c.Mensalidade, c.Mensalidade*c.DuracaoAnos*12 as ValorFinal FROM ALUNO AS a
INNER JOIN Curso AS c
ON a.IdCurso = c.IdCurso
ORDER BY NomeCurso;
```
![ValorFinalCurso](https://github.com/augustohanashiro/MySql_Desafio_2/assets/49253803/07428b64-199e-47ec-8ea0-2d175cac99b4)
