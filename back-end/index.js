import express from "express";
import mongoose from "mongoose";
import cors from "cors";
import dotenv from "dotenv";
import historyRoutes from "./routes/historyRoutes.js";
import subscriptionRoutes from "./routes/subscriptionRoutes.js";
import authRoutes from "./routes/authRoutes.js";
import favoritesRoutes from "./routes/favoritesRoutes.js";

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());
app.use("/api/subscription", subscriptionRoutes);
app.use("/api/history", historyRoutes);
app.use("/api/favorites", favoritesRoutes);
app.use("/api/auth", authRoutes);

mongoose
	.connect(process.env.MONGO_URI, {
		useNewUrlParser: true,
		useUnifiedTopology: true,
	})
	.then(() => {
		console.log("MongoDB connected");
		app.listen(process.env.PORT, () =>
			console.log(`Server running on port ${process.env.PORT}`)
		);
	})
	.catch((err) => console.error(err));
