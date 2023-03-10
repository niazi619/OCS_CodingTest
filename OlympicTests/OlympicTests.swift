//
//  OlympicTests.swift
//  OlympicTests
//
//  Created by MacBook on 09/03/2023.
//

import XCTest
@testable import Olympic

final class OlympicTests: XCTestCase {
    
    func test_get_list_of_games() async {
        do {
            let response = try await NetworkManager().executeNetworkRequestAsync(UrlManager.gamesUrl(), httpMethod: AppConstants.httpMethod.get)
            XCTAssertNotNil(response)
        }
        catch { handleError(methodName: "Receive All Games: Error", error: error) }
        await fulfillExpectation("test_get_list_of_games")
    }
    func test_get_list_of_athletes() async {
        do {
            let response = try await NetworkManager().executeNetworkRequestAsync(UrlManager.athletesUrl(), httpMethod: AppConstants.httpMethod.get)
            XCTAssertNotNil(response)
        }
        catch { handleError(methodName: "Receive All Athletes: Error", error: error) }
        await fulfillExpectation("test_get_list_of_athletes")
    }
    func test_get_medals_of_athlete() async {
        do {
            let response = try await NetworkManager().executeNetworkRequestAsync(UrlManager.athleteDetailsUrl("2"), httpMethod: AppConstants.httpMethod.get)
            XCTAssertNotNil(response)
        }
        catch { handleError(methodName: "Receive Athlete's Medal: Error", error: error) }
        await fulfillExpectation("test_get_medals_of_athlete")
    }
    func test_get_participate_of_game() async {
        do {
            let response = try await NetworkManager().executeNetworkRequestAsync(UrlManager.gameAthletesUrl("2"), httpMethod: AppConstants.httpMethod.get)
            XCTAssertNotNil(response)
        }
        catch { handleError(methodName: "Receive Participate of Game: Error", error: error) }
        await fulfillExpectation("test_get_participate_of_game")
    }
}

// MARK: Helpers
private extension OlympicTests {
    func handleError(methodName: String, error: Error) {
        logErrorInConsole(methodName, error)
        XCTAssertFalse(true)
    }
    func logErrorInConsole(_ methodName: String, _ error: Error) {
        let message = "\n"
            .appending("***** FAILED: \(methodName) *****")
            .appending("\n")
            .appending(error.localizedDescription.replacingOccurrences(of: "=", with: "").replacingOccurrences(of: "\n", with: ""))
            .appending("\n\n\n")
        print(message)
    }
    func fulfillExpectation(_ expectationDescription: String) async {
        expectation(description: expectationDescription).fulfill()
        await waitForExpectations(timeout: 10)
    }
}
