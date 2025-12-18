//
//  SupabaseManager.swift
//  SITARJO
//
//  Created by prk on 29/11/25.
//

import Foundation
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()

    let client: SupabaseClient

    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: "https://tveedhcnyomsuetgtcfc.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR2ZWVkaGNueW9tc3VldGd0Y2ZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE5NzA3MTksImV4cCI6MjA3NzU0NjcxOX0.KyXURqtQWmuBOIlS2P-ftpcLmhGk56y2EAH1fb3I36U"
        )
    }
}
