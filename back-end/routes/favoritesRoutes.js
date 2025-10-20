import express from "express";
import verifyToken from "../middleware/verifyToken.js";
import Favorite from "../models/favorite.js";

const router = express.Router();

router.post("/", verifyToken, async (req, res) => {
	const userId = req.user.userId;
	const { stationId } = req.body;

	if (!stationId) return res.status(400).json({ message: "Missing stationId" });

	try {
		const newFavorite = new Favorite({ userId, stationId });
		await newFavorite.save();
		res.status(201).json({ message: "Favorite added", favorite: newFavorite });
	} catch (err) {
		res.status(500).json({ message: err.message });
	}
});

router.get("/", verifyToken, async (req, res) => {
	const userId = req.user.userId;

	try {
		const favorites = await Favorite.find({ userId });
		res.status(200).json({ favorites });
	} catch (err) {
		res.status(500).json({ message: err.message });
	}
});

export default router;
