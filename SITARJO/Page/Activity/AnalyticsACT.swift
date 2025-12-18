import SwiftUI

struct ProgressBarRow: View {
    let title: String
    let opsText: String
    let percentText: String
    let progress: Double
    let geometry: GeometryProxy

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Text(title).font(.system(size: 16))
                Spacer()
                Text(opsText).font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                Text(percentText).font(.system(size: 16)).foregroundStyle(Color.black)
            }
            Spacer()
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.biruProgress.opacity(0.2))

                Rectangle()
                    .fill(Color.biruProgress)
                    .frame(width: geometry.size.width * progress/100 * 0.96, height: 10)
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

struct WeeklyPerformanceCard: View {
    @ObservedObject var vm: WeeklyActionVM
    let geometry: GeometryProxy
    let progress1: Double
    let progress2: Double

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.stroke, lineWidth: 1)
                .fill(Color.white)

            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar").foregroundStyle(Color.purple)
                    Text("Weekly Performance")
                        .font(.system(size: 20))
                }
                .padding(.top, 16)

                VStack(alignment: .leading) {
                    Spacer()

                    ForEach(vm.WeeklyAction) { action in
                        ProgressBarRow(
                            title: "Mon",
                            opsText: "\(action.Monday) ops",
                            percentText: "100",
                            progress: action.Monday,
                            geometry: geometry
                        )
                        ProgressBarRow(
                            title: "Tue",
                            opsText: "\(action.Tuesday) ops",
                            percentText: "100",
                            progress: action.Tuesday,
                            geometry: geometry
                        )
                        ProgressBarRow(
                            title: "Wed",
                            opsText: "\(action.Wednesday) ops",
                            percentText: "100",
                            progress: action.Wednesday,
                            geometry: geometry
                        )
                        ProgressBarRow(
                            title: "Thu",
                            opsText: "\(action.Thursday) ops",
                            percentText: "100",
                            progress: action.Thursday,
                            geometry: geometry
                        )
                        ProgressBarRow(
                            title: "Fri",
                            opsText: "\(action.Friday) ops",
                            percentText: "100",
                            progress: action.Friday,
                            geometry: geometry
                        )
                        ProgressBarRow(
                            title: "Sat",
                            opsText: "\(action.Saturday) ops",
                            percentText: "100",
                            progress: action.Saturday,
                            geometry: geometry
                        )
                        ProgressBarRow(
                            title: "Sun",
                            opsText: "\(action.Sunday) ops",
                            percentText: "100",
                            progress: action.Sunday,
                            geometry: geometry
                        )
                    }

                    Spacer()
                }
                .onAppear {
                    Task {
                        await vm.loadAction()
                    }
                }


                Spacer()
            }
            .padding(.horizontal, geometry.size.width * 0.04)
        }
        .frame(height: geometry.size.height * 0.25)
    }
}

struct TodaySummaryCard: View {
    let geometry: GeometryProxy

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.stroke, lineWidth: 1)
                .fill(Color.white)

            VStack(alignment: .leading) {
                Spacer()

                HStack {
                    Image(systemName: "chart.bar.xaxis").foregroundStyle(Color.blue)
                    Text("Today's Summary").font(.system(size: 16))
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)

                Spacer()

                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(alignment: .leading) {
                            Spacer()
                            HStack {
                                Image("sun")
                                Text("Morning Peak").font(.system(size: 14))
                            }
                            Spacer()
                            Text("7:00 - 9:00 AM")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("18 operations (38%)")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.abuTulisan)
                        }
                    }
                    .frame(width: geometry.size.width * 0.4)

                    Spacer()

                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(alignment: .leading) {
                            Spacer()
                            HStack {
                                Image("night")
                                Text("Evening Peak").font(.system(size: 14))
                            }
                            Spacer()
                            Text("5:00 - 7:00 PM")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("15 operations (32%)")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.abuTulisan)
                        }
                    }
                    .frame(width: geometry.size.width * 0.4)

                    Spacer()
                }
                .padding()

                Spacer()

                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.abuContainer.opacity(0.5))

                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Text("Usage Insight").font(.system(size: 16))
                        }
                        .padding(.horizontal, geometry.size.width * 0.04)

                        Spacer()

                        HStack {
                            Text("Analysis shows optimal drying time is between 10 AM - 4 PM based on weather patterns.")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.abuTulisan)
                        }
                        .padding(.horizontal, geometry.size.width * 0.04)

                        Spacer()
                    }
                    .padding(.vertical, 8)

                }
                .padding(.horizontal, 16)
                .padding(.vertical, geometry.size.width * 0.02)
                .frame(height: geometry.size.height * 0.2)

                Spacer()
            }

            Spacer()
        }
        .frame(height: geometry.size.height * 0.35)
    }
}

struct AnalyticsACT: View {
    @StateObject var vm = WeeklyActionVM()

    @State var progress1 = 94.0
    @State var progress2 = 99.2

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color.abuKecil

                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer()

                        WeeklyPerformanceCard(
                            vm: vm,
                            geometry: geometry,
                            progress1: progress1,
                            progress2: progress2
                        )

                        Spacer()

                        TodaySummaryCard(geometry: geometry)
                            .padding(.top, geometry.size.height * 0.3)

                        Spacer()
                    }
                    .padding(.vertical, geometry.size.height * 0.2)
                }
            }
        }
    }
}

#Preview {
    AnalyticsACT()
}

