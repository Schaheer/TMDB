//
//  TMDBTests.swift
//  TMDBTests
//
//  Created by Schaheer on 19/01/2025.
//

import XCTest
@testable import TMDB

final class TMDBTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//final class MoviesViewModelTests: XCTestCase {
//    var viewModel: MoviesViewModel!
//    var mockUseCase: MockMoviesUseCase!
//
//    override func setUpWithError() throws {
//        mockUseCase = MockMoviesUseCase()
//        viewModel = MoviesViewModel(useCase: mockUseCase)
//    }
//
//    override func tearDownWithError() throws {
//        viewModel = nil
//        mockUseCase = nil
//    }
//
//    func testGetPopularMovies_SuccessfulResponse() async throws {
//        // Arrange
//        mockUseCase.mockResponse = MoviesResponse(results: [Results(id: 1, title: "Test Movie", poster_path: "/test.jpg")])
//
//        // Act
//        await viewModel.getPopularMovies()
//
//        // Assert
//        XCTAssertNotNil(viewModel.results)
//        XCTAssertEqual(viewModel.results?.first?.title, "Test Movie")
//    }
//
//    func testGetPopularMovies_FailureResponse() async throws {
//        // Arrange
//        mockUseCase.mockError = NetworkError.requestFailed
//
//        // Act
//        await viewModel.getPopularMovies()
//
//        // Assert
//        XCTAssertNil(viewModel.results)
//    }
//}
//
//class MockMoviesUseCase: MoviesUseCaseProtocol {
//    var mockResponse: MoviesResponse?
//    var mockError: Error?
//
//    func getPopularMovies(request: PopularMoviesRequest) async throws -> MoviesResponse? {
//        if let error = mockError {
//            throw error
//        }
//        return mockResponse
//    }
//}
