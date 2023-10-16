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
      * define idWorkspaces = $.[0].id

      @Agregar_clientes_a_Workspaces
      Scenario: Agregar clientes
        Given call Sample.feature@Listar_espacios_de_trabajos
        And base url https://api.clockify.me/api/
        And endpoint /v1/workspaces/{{idWorkspaces}}/clients
        And header Content-Type = application/json
        And header Accept = */*
        And header x-api-key = NGRhZjQ2ZTMtYTczYS00ZDk2LTk3ZGMtNDQ0MDNjZTFkNTFi
        And body addClient.json
        When execute method POST
        Then the status code should be 201
        And validate response should be name = newClient1
        * define idClient = $.id

        @DeleteClient @Execute
          Scenario:Eliminar cliente
          Given call Sample.feature@Agregar_clientes_a_Workspaces
          And base url https://api.clockify.me/api/
          And endpoint v1/workspaces/{{idWorkspaces}}/clients/{{idClient}}
          When execute method DELETE
          Then the status code should be 200

          @CrearWorkspaces
          Scenario: Crear workspaces
          Given base url https://api.clockify.me/api/
          And endpoint /v1/workspaces
          And set value "Work3" of key name in body addWorkspaces.json
          When execute method POST
          Then the status code should be 201
















