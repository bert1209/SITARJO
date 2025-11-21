//
//  ApiService.swift
//  SITARJO
//
//  Created by prk on 14/10/25.
//


import Foundation


//class ApiService {
//    private let esp32BaseURL = "http://10.143.212.123"
//
//    // Fungsi untuk mengambil data sensor
//    func fetchData(completion: @escaping (Result<ESPData, Error>) -> Void) {
//        guard let url = URL(string: "http://10.143.212.123/data") else {
//            print("URL tidak valid")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                print("EROR1")
//                return
//            }
//
//            guard let data = data else {
//                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Tidak ada data yang diterima"])
//                completion(.failure(error))
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(ESPData.self, from: data)
//                completion(.success(decodedData))
//            } catch {
//                completion(.failure(error))
//                print("EROR2")
//            }
//        }.resume()
//    }
//    
//    enum Command: String {
//        case tarik = "tarik"
//        case dorong = "dorong"
//    }
//
//    func sendAction(command: Command, completion: @escaping (Bool, String) -> Void) {
//        guard let url = URL(string: "\(esp32BaseURL)/action") else {
//            completion(false, "URL tidak valid")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        let postString = "command=\(command.rawValue)"
//        request.httpBody = postString.data(using: .utf8)
//
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if error != nil {
//                DispatchQueue.main.async {
//                    completion(false, "Gagal mengirim perintah.")
//                }
//                return
//            }
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                DispatchQueue.main.async {
//                    completion(true, "Perintah berhasil dikirim!")
//                }
//            } else {
//                DispatchQueue.main.async {
//                    completion(false, "ESP32 merespons dengan error.")
//                }
//            }
//        }.resume()
//    }
//    
//    
//}

class ApiService {
    static let shared = ApiService()
    
    private let esp32BaseURL = "http://10.198.65.123"
    
    private init() {}

    // MARK: - Fetch Data dari ESP32
    func fetchData(completion: @escaping (Result<ESPData, Error>) -> Void) {
        guard let url = URL(string: "\(esp32BaseURL)/data") else {
            print("❌ URL tidak valid")
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check network error
            if let error = error {
                print("❌ Network Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            // Check HTTP response
            if let httpResponse = response as? HTTPURLResponse {
                print("📡 HTTP Status Code: \(httpResponse.statusCode)")
                
                guard httpResponse.statusCode == 200 else {
                    let error = NSError(
                        domain: "",
                        code: httpResponse.statusCode,
                        userInfo: [NSLocalizedDescriptionKey: "HTTP Error: \(httpResponse.statusCode)"]
                    )
                    completion(.failure(error))
                    return
                }
            }

            // Check data
            guard let data = data else {
                print("❌ No data received")
                let error = NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }

            // Debug: Print raw JSON
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📥 Raw JSON from ESP32:")
                print(jsonString)
            }

            // Decode JSON
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(ESPData.self, from: data)
                print("✅ Successfully decoded ESP32 data")
                completion(.success(decodedData))
                
            } catch let DecodingError.keyNotFound(key, context) {
                print("❌ Decoding Error: Key '\(key.stringValue)' not found")
                print("   Context: \(context.debugDescription)")
                print("   Coding Path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))")
//                completion(.failure(error))
                
            } catch let DecodingError.typeMismatch(type, context) {
                print("❌ Decoding Error: Type mismatch for '\(type)'")
                print("   Context: \(context.debugDescription)")
                print("   Coding Path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))")
//                completion(.failure(error))
                
            } catch let DecodingError.valueNotFound(type, context) {
                print("❌ Decoding Error: Value not found for type '\(type)'")
                print("   Context: \(context.debugDescription)")
                print("   Coding Path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))")
//                completion(.failure(error))
                
            } catch let DecodingError.dataCorrupted(context) {
                print("❌ Decoding Error: Data corrupted")
                print("   Context: \(context.debugDescription)")
//                completion(.failure(error))
                
            } catch {
                print("❌ Unknown Decoding Error: \(error.localizedDescription)")
//                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - Command Enum
    enum Command: String {
        case tarik = "tarik"
        case dorong = "dorong"
    }
    
    enum ControlMode: String {
        case smartAuto = "SMART_AUTO"
        case manual = "MANUAL"
    }

  
    
    // MARK: - Send Action ke ESP32
    func sendAction(command: Command, completion: @escaping (Bool, String) -> Void) {
        guard let url = URL(string: "\(esp32BaseURL)/action") else {
            print("❌ URL tidak valid")
            DispatchQueue.main.async {
                completion(false, "URL tidak valid")
            }
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 0 // 10 seconds timeout

        let postString = "command=\(command.rawValue)"
        request.httpBody = postString.data(using: .utf8)

        print("📤 Sending command: \(command.rawValue)")

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Check network error
            if let error = error {
                print("❌ Send Action Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false, "Network error: \(error.localizedDescription)")
                }
                return
            }
            
            // Check HTTP response
            if let httpResponse = response as? HTTPURLResponse {
                print("📡 Response Status Code: \(httpResponse.statusCode)")
                
                // Print response body if available
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("📥 Response Body: \(responseString)")
                }
                
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(true, "Command sent successfully!")
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false, "ESP32 error (Status: \(httpResponse.statusCode))")
                    }
                }
            } else {
                print("❌ Invalid HTTP response")
                DispatchQueue.main.async {
                    completion(false, "Invalid response from ESP32")
                }
            }
        }.resume()
    }
    
    // MARK: - Send Mode Change
    func setMode(mode: ControlMode, completion: @escaping (Bool, String) -> Void) {
            
            // 1. Siapkan URL: http://10.143.212.123/setMode
            guard let url = URL(string: "\(esp32BaseURL)/setMode") else {
                completion(false, "URL /setMode tidak valid")
                return
            }

            // 2. Buat request dan set sebagai POST
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            // 3. Siapkan body-nya. Inilah yang akan dibaca ESP32
            //    Contoh: "mode=SMART_AUTO"
            let postString = "mode=\(mode.rawValue)"
            request.httpBody = postString.data(using: .utf8)
            
            // 4. Beri tahu server format datanya (wajib untuk ESP32)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

            // 5. Kirim perintah
            URLSession.shared.dataTask(with: request) { data, response, error in
                // Pastikan balasan sukses (HTTP 200)
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(true, "Mode berhasil diubah!")
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false, "Gagal mengubah mode: \(error?.localizedDescription ?? "Respon server error")")
                    }
                }
            }.resume()
        }
    
    func setSuhuThreshold(suhu: Int, completion: @escaping (Bool, String) -> Void) {
        // 1. Siapkan URL: http://10.143.212.123/setSuhu
        guard let url = URL(string: "\(esp32BaseURL)/setSuhu") else {
            completion(false, "URL /setSuhu tidak valid")
            return}

            // 2. Buat request POST
            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            // 3. Buat body: "suhuBaru=25"
            let postString = "suhuBaru=\(suhu)"
            request.httpBody = postString.data(using: .utf8)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

            // 4. Kirim
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                        completion(true, "Ambang batas suhu berhasil diatur!")
                    } else {
                        completion(false, "Gagal mengatur suhu.")
                    }
                }
            }.resume()
        }
    
}

// MARK: - Error Types
extension ApiService {
    enum APIError: LocalizedError {
        case invalidURL
        case noData
        case decodingError(String)
        case networkError(String)
        case httpError(Int)
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "Invalid URL"
            case .noData:
                return "No data received from server"
            case .decodingError(let message):
                return "Failed to decode data: \(message)"
            case .networkError(let message):
                return "Network error: \(message)"
            case .httpError(let code):
                return "HTTP error: \(code)"
            }
        }
    }
}


