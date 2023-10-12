@Clockify
Feature: clockify
    @Listar_espacios_de_trabajos
    Scenario:
      Given base url https://api.clockify.me/api
      And endpoint /v1/workspaces
      And header Content-Type = application/json
      And header Accept = */*
      And header x-api-key = NGRhZjQ2ZTMtYTczYS00ZDk2LTk3ZGMtNDQ0MDNjZTFkNTFi
      When execute method GET
      Then the status code should be 200
      * define iDworkspaces = $.[0].id

      @Agregar_clientes_a_scenarios
      Scenario:
        Given call Sample.feature@Clockify
        And base url https://api.clockify.me/api/
        And endpoint /v1/workspaces/{{iDworkspaces}}/clients
        And header Content-Type = application/json
        And header Accept = */*
        And header x-api-key = NGRhZjQ2ZTMtYTczYS00ZDk2LTk3ZGMtNDQ0MDNjZTFkNTFi
        And body addClient.json
        When execute method POST
        Then the status code should be 201








