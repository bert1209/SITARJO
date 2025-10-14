//
//  ApiService.swift
//  SITARJO
//
//  Created by prk on 14/10/25.
//


import Foundation

class ApiService {

    // Ganti dengan alamat IP ESP32-mu!
    private let esp32BaseURL = "http://10.117.126.123"

    // Fungsi untuk mengambil data sensor
    func fetchData(completion: @escaping (Result<ESPData, Error>) -> Void) {
        guard let url = URL(string: "\(esp32BaseURL)/data") else {
            print("URL tidak valid")
            return
        }

        // Membuat task untuk melakukan GET request
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                // Buat error kustom jika data kosong
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Tidak ada data yang diterima"])
                completion(.failure(error))
                return
            }

            // Coba decode JSON menjadi struct DeviceData
            do {
                let decodedData = try JSONDecoder().decode(ESPData.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume() // Jangan lupa .resume() untuk memulai task!
    }
    
    enum Command: String {
        case tarik = "tarik"
        case dorong = "dorong"
    }

    func sendAction(command: Command, completion: @escaping (Bool, String) -> Void) {
        guard let url = URL(string: "\(esp32BaseURL)/action") else {
            completion(false, "URL tidak valid")
            return
        }

        // Konfigurasi request sebagai POST
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Siapkan data body: "command=tarik" atau "command=dorong"
        let postString = "command=\(command.rawValue)"
        request.httpBody = postString.data(using: .utf8)

        // Set header agar ESP32 tahu ini adalah form data
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(false, "Gagal mengirim perintah.")
                }
                return
            }

            // Memastikan request berhasil (HTTP status code 200 OK)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(true, "Perintah berhasil dikirim!")
                }
            } else {
                DispatchQueue.main.async {
                    completion(false, "ESP32 merespons dengan error.")
                }
            }
        }.resume()
    }
}
