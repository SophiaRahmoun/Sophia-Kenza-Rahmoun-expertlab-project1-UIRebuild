import mongoose from "mongoose";

const HistorySchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  bikeId: { type: String, required: true },
  date: { type: Date, default: Date.now },
  distance: { type: Number, required: true },
  rating: { type: Number, min: 1, max: 5 }
});

export default mongoose.model("History", HistorySchema);